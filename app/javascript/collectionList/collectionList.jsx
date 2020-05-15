import { h } from 'preact';
// import { PropTypes } from 'preact-compat';
import CollectionForm from '../collectionForm/collectionForm';

export const CollectionList = () => {
  // console.log(collections);
  return (
    <div className="collections-wrapper">
      <CollectionForm />
    </div>
  );
};

// <CollectionContainer collections={collections}/>
// CollectionList.propTypes = {
//   collections: PropTypes.object
// }
