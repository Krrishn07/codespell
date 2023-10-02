import random

def choose_word():
    word_list = ["python", "hangman", "programming", "developer", "computer"]
    return random.choice(word_list)

def play_hangman():
    word_to_guess = choose_word()
    guessed_word = ["_" for _ in word_to_guess]
    attempts_left = 6
    
    while attempts_left > 0:
        print(" ".join(guessed_word))
        guess = input(f"Guess a letter ({attempts_left} attempts left): ").lower()
        
        if guess in word_to_guess:
            for i in range(len(word_to_guess)):
                if word_to_guess[i] == guess:
                    guessed_word[i] = guess
        else:
            attempts_left -= 1
            print("Incorrect guess. Try again.")
        
        if "_" not in guessed_word:
            print("Congratulations! You guessed the word:", word_to_guess)
            break
    
    if "_" in guessed_word:
        print("You ran out of attempts. The word was:", word_to_guess)

play_hangman()
