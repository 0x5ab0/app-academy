import { connect } from 'react-redux';
import StepListItem from './step_list_item';

import { updateStep, destroyStep } from '../../actions/step_actions';

const mapDispatchToProps = (dispatch, { step }) => ({
    destroyStep: () => { console.log(`Destroying step: ${step.title}`); dispatch(destroyStep(step))},
    updateStep: updatedStep => dispatch(updateStep(updatedStep))
});

export default connect(
    null, // step prop is already passed in
    mapDispatchToProps
)(StepListItem);
