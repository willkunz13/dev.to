import { h, render } from 'preact';
import { CollectionContainer } from '../collectionContainer/collectionContainer';

function loadElement() {
  const root = document.getElementById('collection-container');
  const { collections } = root.dataset;
  if (root) {
    render(
      <CollectionContainer collections={collections} />,
      root,
      root.firstElementChild,
    );
  }
}
loadElement();
