require 'rails_helper'

RSpec.describe Cat, type: :model do
  it 'should have a name' do
    cat = Cat.create(age: 2, enjoys: 'cuddles and belly rubs')
    expect(cat.errors[:name]).to_not be_empty
  end
  it 'should have an age' do
    cat = Cat.create(name: 'Boo', enjoys: 'cuddles and belly rubs')
    expect(cat.errors[:age]).to_not be_empty
  end
  it 'should have an enjoys' do
    cat = Cat.create(name: 'Boo', age: 2)
    expect(cat.errors[:enjoys]).to_not be_empty
  end
  it 'should have an enjoys that is 10 characters long' do
    cat = Cat.create(name: 'Boo', age: 2, enjoys: 'sleep')
    expect(cat.errors[:enjoys]).to_not be_empty
  end
end
