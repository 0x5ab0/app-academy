import React from 'react';

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
        const { step, removeStep } = this.props;

        return (
            <li>
                <div>
                    <h3>{ step.title }</h3>
                    <p>{ step.body }</p>
                </div>
                <div>
                    <button onClick={this.toggleStep}>
                        { step.done ? 'Undo' : 'Done' }
                    </button>
                    <button onClick={removeStep}>
                        Delete
                    </button>
                </div>
            </li>
        )
    }
}

export default StepListItem;