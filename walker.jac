
#here we initialize the walker which we named talker.
walker talker {
    has utterance;
    state {
        #prints out the message and prompts variables for the node the walker is currently on
        std.out(here.message,here.prompts);
        
        #here we take the input from the terminal.
        utterance = std.input("> ");
        
        #if the user enters "quit" the programs ends.
        if(utterance=="quit"): disengage;
        
        #checks the utterance and determine which node to traverse too.
        take -[transition(intent==utterance )] -> node::state else{
            take here ;
            }
    }
}


