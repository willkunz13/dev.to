import { h } from 'preact';
import 'preact/debug';
import render from 'preact-render-to-json';
import { ReadingList } from '../readingList';

describe('<ReadingList />', () => {
  it('renders properly', () => {
    const tree = render(<ReadingList availableTags={['discuss']} />);
    expect(tree).toMatchSnapshot();
  });

  it('should load articles', () => {
    const { getByText } = render(<ReadingList availableTags={['discuss']} />);

    expect(getByText('hi')).toBeInTheDocument();
  });
});
