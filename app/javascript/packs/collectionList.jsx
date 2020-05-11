import { h, render } from 'preact';
import { getUserDataAndCsrfToken } from '../chat/util';
import { CollectionList } from '../collectionList/collectionList';

function loadElement() {
  getUserDataAndCsrfToken().then(() => {
    const root = document.getElementById('collection-list');
    if (root) {
      render(<CollectionList />, root, root.firstElementChild);
    }
  });
}

window.InstantClick.on('change', () => {
  loadElement();
});

loadElement();
