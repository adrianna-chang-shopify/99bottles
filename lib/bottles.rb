class Bottles
  attr_accessor :verse

  def initialize
    puts "Made a new bottle"
  end

  def verse(current_count)
    case current_count
    when 3..99
      first_bottle_form = 'bottles'
      second_bottle_form = 'bottles'
    when 2
      first_bottle_form = 'bottles'
      second_bottle_form = 'bottle'
    when 1
      first_bottle_form = 'bottle'
      second_bottle_form = 'bottles'
    when 0
      first_bottle_form = 'bottles'
      second_bottle_form = 'bottles'
    end

    current_count = current_count == 0 ? 'no more' : current_count

    next_current_count = case current_count
    when 1
      'no more'
    when 'no more'
      '99'
    else
      current_count - 1
    end

    take_text = generate_take_text(current_count)

    "#{set_case(current_count, 'capitalize')} #{first_bottle_form} of beer on the wall, #{current_count} #{first_bottle_form} of beer.\n" \
    "#{take_text}, #{next_current_count} #{second_bottle_form} of beer on the wall.\n"
  end

  def verses(start_count, until_count)
    string_to_return = ""
    for i in 0..(start_count - until_count) do
      string_to_return += verse(start_count - i)
      string_to_return += "\n" unless i == start_count - until_count
    end
    string_to_return
  end

  def song
    verses(99, 0)
  end

  private

  def generate_take_text(current_count)
    case current_count
    when 1
      'Take it down and pass it around'
    when 'no more'
      'Go to the store and buy some more'
    else
      'Take one down and pass it around'
    end
  end

  def set_case(text, command)
    if text.is_a?(String)
      text.send(command)
    else
      text
    end
  end
end
