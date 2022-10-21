# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Publication, type: :request do
  before(:all) do
    @user = create(:user)
    @review = create(:review)
    @review.save
    @request = create(:request)
    @request.save
    @publication = create(:publication)
    @publication.save
  end

  describe 'crear publication' do
    it 'should create a publication' do
      expect do
        post publications_new_path, params: {
          publication: {
            title: @publication.title,
            sport: @publication.sport,
            description: @publication.description,
            image: @publication.image,
            price: @publication.price,
            category: @publication.category
          }
        }
      end.to change(Publication, :count).by(1)
    end

    it 'should not create a publication with invalid data' do
      expect do
        post publications_new_path, params: {
          publication: {
            title: @publication.title,
            sport: @publication.sport,
            description: @publication.description,
            image: @publication.image,
            price: -1000,
            category: @publication.category
          }
        }
      end.to change(Publication, :count).by(0)
    end
  end

  describe 'PATCH /publications/:id' do
    it 'should update a publication\'s price' do
      patch publications_update_path(@publication), params: {
        publication: {
          title: @publication.title,
          sport: @publication.sport,
          description: @publication.description,
          image: @publication.image,
          price: 2550,
          category: @publication.category
        }
      }
      expect(Publication.find(@publication.id).price).to eq(2550)
    end

    it 'should not update a publication with invalid title' do
      patch publications_update_path(@publication), params: {
        publication: {
          title: '',
          sport: @publication.sport,
          description: @publication.description,
          image: @publication.image,
          price: @publication.price,
          category: @publication.category
        }
      }
      expect(Publication.find(@publication.id).title).to eq(@publication.title)
    end

    it 'should not update a publication with invalid price' do
      patch publications_update_path(@publication), params: {
        publication: {
          title: @publication.title,
          sport: @publication.sport,
          description: @publication.description,
          image: @publication.image,
          price: -1200,
          category: @publication.category
        }
      }
      expect(Publication.find(@publication.id).price).to eq(@publication.price)
    end
  end

  describe 'DELETE /publications/:id' do
    it 'should delete a publication' do
      expect do
        delete publications_delete_path(@publication)
      end.to change(Publication, :count).by(-1)
    end
  end
end
