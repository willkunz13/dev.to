import { h } from 'preact';
import { render } from 'preact-render-to-string';
import { History } from '../history';

describe('<History />', () => {
  it('renders properly', () => {
    const tree = render(<History availableTags={['discuss']} />);
    expect(tree).toMatchSnapshot();
  });
});
