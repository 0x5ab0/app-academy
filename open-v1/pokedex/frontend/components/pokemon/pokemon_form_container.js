import { connect } from 'react-redux';
import { createPokemon } from '../../actions/pokemon_actions';
import PokemonForm from './pokemon_form';

const mapStateToProps = (state) => ({
    errors: state.ui.errors
})

const mapDispatchToProps = (dispatch) => ({
    createPokemon: (pokemon) => dispatch(createPokemon(pokemon))
});

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(PokemonForm)