import { h } from 'preact';

export class CollectionForm extends h {
  constructor() {
    super();
    this.state = {
      collectionTitle: '',
    };
  }

  handleChange = event => {
    this.setState({ collectionTitle: event.target.value });
  };

  handleClick = event => {
    event.preventDefault();
    console.log('Submitting new collection.');
  };

  render() {
    const { collectionTitle } = this.state;
    return (
      <form>
        <input
          type="text"
          name="collectionTitle"
          placeholder="Enter new collection name here..."
          value={collectionTitle}
          onChange={this.handleChange}
        />
        <button onClick={this.handleClick} type="button">
          Submit
        </button>
      </form>
    );
  }
}
