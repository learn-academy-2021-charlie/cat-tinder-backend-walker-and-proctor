require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it 'gets a list of cats' do
      # create a cat
      Cat.create(name: 'Boo', age: 2, enjoys: 'cuddles and belly rubs')
      # make a request
      get '/cats'
      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end
  describe "POST /create" do
    it 'creates a cat' do
      cat_params = {
        cat: {
          name: 'Boo',
          age: 2,
          enjoys: 'cuddles and belly rubs'
        }
      }
      # make a request
      post '/cats', params: cat_params
      new_cat = Cat.first
      expect(response).to have_http_status(200)
      expect(new_cat.name).to eq 'Boo'
      expect(new_cat.age).to eq 2
      expect(new_cat.enjoys).to eq 'cuddles and belly rubs'
    end
  end
  describe "PATCH /update" do
    it 'updates a cat' do
      # create the cat
      cat_params = {
        cat: {
          name: 'Boo',
          age: 2,
          enjoys: 'cuddles and belly rubs'
        }
      }
      post '/cats', params: cat_params
      cat = Cat.first
      # update the cat
      updated_cat_params = {
        cat: {
          name: 'Boo',
          age: 6,
          enjoys: 'cuddles and belly rubs'
        }
      }
      patch "/cats/#{cat.id}", params: updated_cat_params
      updated_cat = Cat.find(cat.id)
      expect(response).to have_http_status(200)
      expect(updated_cat.age).to eq 6
    end
  end
  describe "DELETE /destroy" do
    it 'deletes a cat' do
      # create the cat
      cat_params = {
        cat: {
          name: 'Boo',
          age: 2,
          enjoys: 'cuddles and belly rubs'
        }
      }
      post '/cats', params: cat_params
      cat = Cat.first
      delete "/cats/#{cat.id}"
      expect(response).to have_http_status(200)
      cats = Cat.all
      expect(cats).to be_empty
    end
  end
end
