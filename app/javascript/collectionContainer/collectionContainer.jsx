import { h } from 'preact';
import { PropTypes } from 'preact-compat';

export const CollectionContainer = ({ collections }) => {
  const parsedCollections = JSON.parse(collections);

  const getArticles = articles => {
    if (articles.length !== 0) {
      return articles.map(article => <li>{article.name}</li>);
    }
    return <li>No articles in this collection.</li>;
  };

  const displayCollections = parsedCollections.data.map(collection => (
    <article>
      <header>
        <h3>{collection.name}</h3>
      </header>
      <ul>{getArticles(collection.articles)}</ul>
    </article>
  ));
  return <section>{displayCollections}</section>;
};

CollectionContainer.defaultProps = {
  collections: PropTypes.string,
};

CollectionContainer.propTypes = {
  collections: PropTypes.string,
};
