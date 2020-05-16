import { h, Component } from 'preact';
import plusIcon from 'images/plus-icon.svg';
import { PropTypes } from 'preact-compat';
import greenPlusIcon from 'images/plus-successful.svg';

export default class AddToCollection extends Component {
  constructor(props) {
    super(props);
    this.state = {
      isAdded: false,
      menuOpen: false,
    };
  }

  addArticle = collectionId => {
    const { articleid } = this.props;

    fetch('/collections_list', {
      method: 'PATCH',
      headers: {
        Accept: 'application/json',
        'X-CSRF-Token': window.csrfToken,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        article_id: articleid,
        collection_id: collectionId,
      }),
      credentials: 'same-origin',
    }).then(data => this.resetForm());
  };

  resetForm = () => {
    this.setState({ isAdded: true, menuOpen: false });
  };

  toggleMenu = () => {
    const { menuOpen } = this.state;
    this.setState({ menuOpen: !menuOpen });
  };

  render() {
    const { collections } = this.props;
    const { isAdded, menuOpen } = this.state;

    const collectionsListItems = collections.map(col => (
      <li key={col.id} onClick={() => this.addArticle(col.id)}>
        {col.name}
        <img src={plusIcon} alt="Add article to collection icon" />
      </li>
    ));

    const dipslayIcon = isAdded ? greenPlusIcon : plusIcon;
    const buttonDisplay =
      collections.length > 0
        ? 'Add To Collections'
        : 'No collections to add to...';

    return (
      <div className="add-article-container">
        <button
          type="button"
          onClick={() => this.toggleMenu()}
        >
          <img src={dipslayIcon} alt="Add to collections icon" />
          {buttonDisplay}
        </button>
        {menuOpen && (
          <div className="collections-list">
            <ul>{collectionsListItems}</ul>
          </div>
        )}
      </div>
    );
  }
}

AddToCollection.defaultProps = {
  articleid: PropTypes.number,
  collections: PropTypes.array,
};

AddToCollection.propTypes = {
  articleid: PropTypes.number,
  collections: PropTypes.array,
};
