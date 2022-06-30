import { connect } from 'react-redux';
import { requestSinglePokemon } from '../../actions/pokemon_actions';
import { selectPokemonMovesNames } from '../../reducers/selectors';
import PokemonDetail from './pokemon_detail';

const mapStateToProps = (state, ownProps) => ({
    pokemon: state.entities.pokemon[ownProps.match.params.pokemonId],
    moves: selectPokemonMovesNames(state),
    items: Object.values(state.entities.items)
});

const mapDispatchToProps = (dispatch) => ({
    requestSinglePokemon: (pokemonId) => dispatch(requestSinglePokemon(pokemonId))
});

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(PokemonDetail);