export PATH=$(npm bin):$PATH
export GH_TOKEN=$GITHUB_TOKEN

VERSION=`auto version`
echo "Hola esto es una prueba"
echo $GH_TOKEN
echo $GITHUB_TOKEN


## Support for label 'skip-release'
if [ ! -z "$VERSION" ]; then
  ## Update Changelog
  auto changelog

  ssh -T git@github.com

  ## Publish Package
  npm version $VERSION -m --force "Bump version to: %s"

  ## Create GitHub Release
  git push --follow-tags --set-upstream origin $branch
  auto release
fi