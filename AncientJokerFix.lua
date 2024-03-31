--- STEAMODDED HEADER
--- MOD_NAME: AncientJokerFix
--- MOD_ID: AncientJokerFix
--- MOD_AUTHOR: [gabepesco]
--- MOD_DESCRIPTION: This mod updates the logic that selects the suit buffed by the Ancient Joker each round. It will work the same way The Idol, Castle, and Mail-In Rebate jokers do, where the random suit selection is weighted against your deck. Never again will Ancient Joker buff a suit that you have no cards of in your deck!

----------------------------------------------
------------MOD CODE -------------------------

function reset_ancient_card()
    G.GAME.current_round.ancient_card.suit = 'Spades'
    local valid_ancient_cards = {}
    for k, v in ipairs(G.playing_cards) do
        if v.ability.effect ~= 'Stone Card' then
            valid_ancient_cards[#valid_ancient_cards+1] = v
        end
    end
    if valid_ancient_cards[1] then 
        local ancient_card = pseudorandom_element(valid_ancient_cards, pseudoseed('anc'..G.GAME.round_resets.ante))
        G.GAME.current_round.ancient_card.suit = ancient_card.base.suit
    end
end

----------------------------------------------
------------MOD CODE END----------------------
