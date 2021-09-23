import React from 'react';
import { Route } from 'react-router';

import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from './pokemon_detail_container';

class PokemonIndex extends React.Component{
    constructor(props){
        super(props)
    }
  
    componentDidMount(){
        this.props.requestAllPokemon()
    }
  
    render() {
        const pokemonItems = this.props.pokemon.map(pokemon => (
            <PokemonIndexItem key={ pokemon.id } pokemon={ pokemon } />
        ));

        return (
            <section className="pokedex">
                <Route path='/pokemon/:pokemonId' component={ PokemonDetailContainer } />
                <ul>{ pokemonItems }</ul>
            </section>
        )
    }
}
  
export default PokemonIndex;