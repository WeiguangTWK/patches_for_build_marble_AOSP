#!/usr/bin/env bash
set -euo pipefail

PATCH_ROOT="${1:-/home/weiguangtwk/patches_for_build_marble_AOSP/split_commits}"
ANDROID_ROOT="${ANDROID_ROOT:-/home/weiguangtwk/android/lineage}"

check_project_ready() {
    local project="$1"
    local full="$ANDROID_ROOT/$project"

    git -C "$full" rev-parse --git-dir >/dev/null

    if [ -d "$(git -C "$full" rev-parse --git-dir)/rebase-apply" ] ||
       [ -d "$(git -C "$full" rev-parse --git-dir)/rebase-merge" ]; then
        echo "ERROR: git am/rebase in progress: $project" >&2
        exit 1
    fi

    if ! git -C "$full" diff --quiet || ! git -C "$full" diff --cached --quiet; then
        echo "ERROR: tracked changes exist before applying: $project" >&2
        git -C "$full" status --short
        exit 1
    fi
}

mapfile -t groups < <(
    find "$PATCH_ROOT" -type f -name '*.patch' -printf '%h\n' |
    sort -u |
    sed "s#^$PATCH_ROOT/##"
)

for project in "${groups[@]}"; do
    echo
    echo "==> $project"

    check_project_ready "$project"

    mapfile -t patches < <(find "$PATCH_ROOT/$project" -maxdepth 1 -type f -name '*.patch' | sort)

    git -C "$ANDROID_ROOT/$project" am \
        --3way \
        --committer-date-is-author-date \
        "${patches[@]}"
done

echo
echo "All patches applied."