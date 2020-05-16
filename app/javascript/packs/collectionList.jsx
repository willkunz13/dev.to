import { h, render } from 'preact';
import { CollectionList } from '../collectionList/collectionList';

function loadElement() {
  const root = document.getElementById('collection-list');
  const { collections } = root.dataset;
  if (root) {
    render(
      <CollectionList collections={collections} />,
      root,
      root.firstElementChild,
    );
  }
}
loadElement();
