import { h, render } from 'preact';
// import { getUserDataAndCsrfToken } from '../chat/util';
import { CollectionContainer } from '../collectionContainer/collectionContainer';

function loadElement() {
  // getUserDataAndCsrfToken().then(({ currentUser }) => {
  const root = document.getElementById('collection-container');
  const { collections } = root.dataset;
  if (root) {
    render(
      <CollectionContainer collections={collections} />,
      root,
      root.firstElementChild,
    );
  }
  // });
}
// window.InstantClick.on('change', () => {
//   loadElement();
// });
loadElement();
