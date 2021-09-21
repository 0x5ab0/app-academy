import React from 'react';

class PokemonIndex extends React.Component {
    constructor(props) {
        super(props)
    }

    componentDidMount() {
        this.props.requestAllPokemon();
    }

    render() {
        return(
            <ul>
                { this.props.pokemon.map(pokemon => (
                    <li>
                        <img src={ pokemon.imageUrl } height="20px" width="20px" />
                        <span> { pokemon.name }</span>
                    </li>
                )) }
            </ul>
        );
    }
}

export default PokemonIndex;
