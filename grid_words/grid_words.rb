#!/usr/bin/env ruby

=begin

If you've heard of games like Boggle and Ruzzle, this is a "solver" for those
kinds of letter grids. Given a grid of letters (2D rectangular array)
and a dictionary of valid words, find all of the words in the grid that match a
word in the dictionary. This must be done by following a valid path from letter to
letter in the graph.

For example, given this grid and dict:

grid =
ART
SMS
FEE

dict = ['ARTS', 'FEES', 'SMARTS', 'RAM', 'BATTLEAXE']

There is a path to each of the words in the dict. Take 'ARTS', for example:
    Start in the top left: A -> R -> T -> (down) S.
=end

def find_valid_words(grid, dict)
    # iterate through characters in grid
    grid.each_with_index do |row, row_index|
        row.each_with_index do |char, index|
            # recurse over all possibilities starting at char
            running_string = char
            adjacent_characters = adjacent_characters_for(char, row_index, index, grid)

            adjacent_characters.each do |adjacent_char|
                running_string += adjacent_char
                # add adjacent character to the running string
                # check for a match in dict
                # remove char and current adjacent char from a list of available characters
                #

                #
            end
        end
    end
    # for each character, test each possible direction
    # remove character from consideration after it's been used
    # keep a running string for each iteration, check if it matches
        # a word in dictionary every time it's appended to
end

# find all strings starting from a base string & position
# calculate all adjacent characters, run it for them while
# passing in the available grid
# until only one char left
def strings_from(running_string, row_index, index, used_indices, grid, valid_words, dict)
    string_to_check = running_string + grid[row_index][index]
    valid_words.push(string_to_check) if dict.include? string_to_check

    adjacent_indices = adjacent_indices_for(row_index, index)

    valid_indices = adjacent_indices - used_indices
    valid_indices.flatten!

    valid_indices.each do |row_index, char_index|
        new_used_indices = used_indices.push([row_index, char_index])
        new_running_string = running_string + grid[row_index][index]
        strings_from(new_running_string, row_index, char_index, new_used_indices, grid, valid_words, dict)
    end
    # compute adjacent indices
    # delete adjacent indices that have already been used
    # recurse through remaining adjacent indicies

    return valid_words if used_indices.size == grid.size - 1
end

def adjacent_indices_for(row_index, char_index)
    indices = [
        [row_index - 1, index], # top
        [row_index + 1, index], # bottom
        [row_index, index - 1], # left
        [row_index, index + 1], # right
        [row_index + 1, index + 1], # top right
        [row_index + 1, index - 1], # top left
        [row_index - 1, index + 1], # bottom right
        [row_index - 1, index - 1], # bottom left
    ]

    indices.select { |row_index, char_index| row_index != -1 && char_index != -1 }
end

grid = [
    ['A', 'R', 'T'],
    ['S', 'M', 'S']
]
dict = ['ARTS', 'FEES', 'SMARTS', 'RAM']

puts "Should be [ARTS, SMARTS, RAM]: #{find_valid_words(grid, dict)}"

