function addToNewUrl() {
  let path = location.pathname;
  let pattern = /^.*\/contact.*$/

  // URLが正しければ変更は不要
  if(path.match(pattern)) return;

  // URLを変更
  history.replaceState('', '', `/review/contact`)
  console.log(1)
}