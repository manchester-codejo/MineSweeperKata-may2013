require 'test/unit'

class TestDisplay < Test::Unit::TestCase
  def test_see_output_of_empty_one_by_one_grid
    mine_field = MineField.new(self)
    mine_field.solve
    assert_equal EmptyCell.new.value, @grid_output
  end

  def test_bob
    mine_field = MineField.new(self)
    mine_field.solve
    #assert @grid_output.equal? EmptyCell.new
  end

  def test_output_of_one_by_one_grid_with_mother_fudging_bomb
    mine_field = MineField.new(self)
    mine_field.plant_a_bomb
    mine_field.solve
    assert_equal BombCell.new.value, @grid_output    
  end

  def output(grid)
    @grid_output = grid
  end
end

class EmptyCell
  EMPTY = ' '

  def value
    EMPTY
  end

  def equal?(other)
    return true
  end
end

class BombCell
  BOMB = '*'

  def value
    BOMB
  end
end


class MineField
  def initialize(display)
    @display = display
    @grid = EmptyCell.new
  end

  def solve
    @display.output(@grid.value)
  end

  def plant_a_bomb
    @grid = BombCell.new  
  end
end