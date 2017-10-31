require 'spec_helper'

RSpec.describe ExecutionScope do
  Prueba = ExecutionScope.generate do
    def test
      "hola"
    end
  end
  before :each do
    @test = Prueba.instance
  end
  it 'should return a new class with a test mode' do
    expect(Prueba).not_to be nil
  end

  it 'should be able to instantiate the new class' do
    expect(@test).not_to be nil
  end

  it 'should create classes with specified instance methods' do
    expect(@test.test).to eq "hola"
  end

  it 'should allow calls to extended methods' do
    Prueba.run
    Prueba.modify
    Prueba.instance
  end
end
