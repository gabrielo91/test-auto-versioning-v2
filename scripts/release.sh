export PATH=$(npm bin):$PATH
export GH_TOKEN=$GITHUB_TOKEN

VERSION=`auto version`

## Support for label 'skip-release'
if [ ! -z "$VERSION" ]; then
  ## Update Changelog
  auto changelog

  ## Publish Package
  npm version $VERSION -m --force "Bump version to: %s"

  ## Create GitHub Release
  git push --follow-tags --set-upstream origin $branch
  auto release
fi