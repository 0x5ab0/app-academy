import React from 'react';

// Bug pending: Toggling steps only appends a new step at the bottom of the list,
// with the toggled done/undone state. Clicking delete only remove the bottom
// step. Might have something to do with initialState; maybe sorts itself out
// after integrating an actual backend / DB.

class StepListItem extends React.Component {
    constructor(props) {
        super(props);

        this.toggleStep = this.toggleStep.bind(this);
    }

    toggleStep(e) {
        const toggledStep = Object.assign(
            {},
            this.props.step,
            { done: !this.props.step.done }
        );

        this.props.receiveStep(toggledStep);
    }

    render() {
        return (
            <li>
                <div>
                    <h3>{ this.props.step.title }</h3>
                    <p>{ this.props.step.body }</p>
                </div>
                <div>
                    <button onClick={this.toggleStep}>
                        { this.props.step.done ? 'Undo' : 'Done' }
                    </button>
                    <button onClick={this.props.removeStep}>
                        Delete
                    </button>
                </div>
            </li>
        )
    }
}

export default StepListItem;