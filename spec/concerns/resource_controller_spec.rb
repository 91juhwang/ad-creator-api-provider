require 'rails_helper'
require 'controller_shared_context'

class Foo
  include ActiveRecord::Persistence
  include ActiveModel::Model
  attr_accessor :id, :name
  def self.all
  end
end
class FoosController < ApplicationController; end

RSpec.describe ResourceController, type: :controller do
  controller FoosController do
    include ResourceController

    def permitted_params
      params.permit(:bar)
    end
  end
  describe 'POST create' do
    include_context 'permit_params'
    let(:foo) { Foo.new(id: 1) }
    let(:params) { { bar: 'foo' } }
    let(:execute_request) { post :create, params: params }

    context 'with valid parameters' do
      before do
        expect(Foo)
          .to receive(:create!)
          .with(permitted_params)
          .and_return(foo)
        execute_request
      end
      it_responds_with 'a success status'
      it_responds_with 'JSON body',
                       '{ "message": "Foo created successfully", "id": 1 }'
    end
    context 'with validation error' do
      before do
        foo.errors.add(:bar, "can't be foo")
        expect(Foo)
          .to receive(:create!)
          .with(permitted_params)
          .and_raise(ActiveRecord::RecordInvalid.new(foo))
        execute_request
      end
      it_responds_with 'a unprocessable entity status'
      it_responds_with 'JSON body',
                       '{ "errors": {"bar": ["can\'t be foo"] }}'
    end
  end
  describe 'GET index' do
    before do
      first_foo = Foo.new(id: 1, name: 'First foo')
      second_foo = Foo.new(id: 2, name: 'Second foo')
      expect(Foo).to receive(:all).and_return([first_foo, second_foo])
      get :index
    end
    it_responds_with 'a success status'
    it_responds_with 'JSON body',
                     '[{"id": 1, "name": "First foo"},
                   {"id": 2, "name": "Second foo"}]'
  end
  def sliced(foo)
    foo.slice('id', 'name')
  end
end