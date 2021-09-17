import React from 'react';
import { uniqueId } from '../../util/id_generator';

class StepForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            title: "",
            body: "",
            done: false,
            todo_id: this.props.todo_id
        };

        this.handleSubmit = this.handleSubmit.bind(this);
    }

    update(property) {
        return e => this.setState({[property]: e.target.value});
    }

    handleSubmit(e) {
        e.preventDefault();
        const step = Object.assign({}, this.state, {id: uniqueId() });
        this.props.receiveStep(step);
        this.setState({
            title: "",
            body: ""
        });
    }

    render() {
        return(
            <form onSubmit={ this.handleSubmit }>
                <label>Title:
                    <input
                        ref="title"
                        value={ this.state.title }
                        placeholder="walk to store"
                        onChange={ this.update('title') }
                        required />
                </label>
                <label>Description:
                    <input
                        ref="body"
                        value={ this.state.body }
                        placeholder="google store directions"
                        onChange={ this.update('body') }
                        required />
                </label>
                <button>Create Step!</button>
            </form>
        );
    }
}

export default StepForm;