import { h, render } from 'preact';
import AddToCollection from '../addToCollection/addToCollection';

function loadElement() {
  const root = document.getElementById('add-to-collection');
  const { articleid, collections } = root.dataset;
  let parsedCollections = JSON.parse(collections);

  if (root) {
    render(
      <AddToCollection articleid={articleid} collections={parsedCollections} />,
      root,
      root.firstElementChild,
    );
  }
}
loadElement();
