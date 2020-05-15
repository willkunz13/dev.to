import { h, Component } from 'preact';

export default class CollectionForm extends Component {
  constructor() {
    super();
    this.state = {
      collectionTitle: '',
    };
  }

  handleChange = event => {
    this.validateForm();
    this.setState({ collectionTitle: event.target.value });
  };

  handleClick = event => {
    event.preventDefault();
    const { collectionTitle } = this.state;

    fetch('/collections_list', {
      method: 'POST',
      headers: {
        Accept: 'application/json',
        'X-CSRF-Token': window.csrfToken,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ name: collectionTitle }),
      credentials: 'same-origin',
    });
    // .then(res => res.json())
    // .then(data => console.log(data));
  };

  validateForm = () => {
    const { collectionTitle } = this.state;
    if (collectionTitle === '') {
      return true;
    }
    return false;
  };

  render() {
    const { collectionTitle } = this.state;
    return (
      <div>
        <header>
          <h2>Create a New Collection</h2>
          <form>
            <input
              type="text"
              name="collectionTitle"
              placeholder="Enter new collection name here..."
              value={collectionTitle}
              onChange={this.handleChange}
            />
            <button
              className="cta"
              type="button"
              onClick={this.handleClick}
              disabled={this.validateForm()}
            >
              Submit
            </button>
          </form>
        </header>
      </div>
    );
  }
}
