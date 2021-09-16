import React from 'react';

class TodoDetailView extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            detailsVisible: false
        };

        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e) {
        e.preventDefault();
        this.setState({
            detailsVisible: this.state.detailsVisible ? false : true
        });
    }

    render() {
        const todo = this.props.todo;
        const detailsVisible = this.state.detailsVisible;

        return (
            <div>
                <button onClick={this.handleClick}><p>{ detailsVisible ? <span>Hide</span> : <span>Show</span>} details</p></button>
                { detailsVisible ? <p>{ todo.body }</p> : '' } 
            </div>
        )
    }
}

export default TodoDetailView;