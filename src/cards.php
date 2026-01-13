<?php

    //Validation Function To Check For Invalid Number Of Players Format
    function validateNumberOfPlayersInput($numberOfPlayers): void
    {
        if(is_null($numberOfPlayers) 
            || $numberOfPlayers == ""
            || !is_numeric($numberOfPlayers)
            || $numberOfPlayers <= 0
        )
        {
            http_response_code(400);
            die("Input value does not exist or value is invalid");
        }
    }

    //Build an array of card list to be distributed to the user.
    //Return response will be ['S-A','S-2'........'C-K'];
    function buildCards(): array
    {
        $cardNumbers = range(1, 13);
        $types = ['S', 'H', 'D', 'C'];
        $cards = [];

        foreach($cardNumbers as $cardNumber)
        {
            foreach($types as $type)
            {
                array_push($cards, $type . "-". mapNumberToCardType($cardNumber));
            }
        }

        return $cards;
    }

    //Return the numberMap if $number matches the array. Otherwise just return back the number. 
    //Return response will either be A,X,J,Q,K or 2-9.
    function mapNumberToCardType(int $number): string
    {
        $numberMap = [
            1 => 'A',
            10 => 'X',
            11 => 'J',
            12 => 'Q',
            13 => 'K'
        ];

        return array_key_exists($number, $numberMap) ? $numberMap[$number] : (string) $number;
    }

    //Distribute the cards to the players.
    //This function uses a formulate to map the shuffled cards to the players accordingly.
    //Example return response will be [['S-K','D-3'], ['S-Q', 'C-2']........]
    function distributeCards($cards, $numberOfPlayers): array
    {
        $playerCards = array_fill(0, $numberOfPlayers, []);

        foreach($cards as $cardIndex => $card)
        {
            $playerIndex = $cardIndex % $numberOfPlayers;
            array_push($playerCards[$playerIndex], $card);
        }

        return $playerCards;
    }

    // Format the array output as a string.
    // Each player's cards are separated by commas (",").
    // Different players' hands are separated by a space (" ").
    function formatCardOutput($playerCards): string
    {
        $output = "";
        foreach($playerCards as $playerCard)
        {
            $output .= implode(",", $playerCard)." ";
        }

        $output = rtrim($output);

        return $output;
    }

    $numberOfPlayers = $_POST['number'] ?? null;

    //Function to validate if the input in valid.
    validateNumberOfPlayersInput($numberOfPlayers);
    $numberOfPlayers = (int) $numberOfPlayers;

    //Function to build an array list of the 52 cards.
    $cards = buildCards();
    shuffle($cards);

    //Function to distribute the shuffled 52 cards to all the players.
    $playerCards = distributeCards($cards, $numberOfPlayers);

    //Format the array to string value.
    $output = formatCardOutput($playerCards);
  
    echo $output;
