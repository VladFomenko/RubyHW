require 'swagger_helper'

RSpec.describe 'api/v1/articles', type: :request do

  path '/api/v1/authors/{author_id}/articles/{article_id}/unpublished' do
    # You'll want to customize the parameter types...
    parameter name: 'author_id', in: :path, type: :integer, description: 'author_id'
    parameter name: 'article_id', in: :path, type: :integer, description: 'article_id'

    get('unpublished article') do
      tags 'Article'
      response(200, 'successful') do
        let(:author_id) { '123' }
        let(:article_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/authors/{author_id}/articles/{article_id}/published' do
    # You'll want to customize the parameter types...
    parameter name: 'author_id', in: :path, type: :integer, description: 'author_id'
    parameter name: 'article_id', in: :path, type: :integer, description: 'article_id'

    get('published article') do
      tags 'Article'
      response(200, 'successful') do
        let(:author_id) { '123' }
        let(:article_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/authors/{author_id}/articles/{article_id}/last_ten_comments' do
    # You'll want to customize the parameter types...
    parameter name: 'author_id', in: :path, type: :integer, description: 'author_id'
    parameter name: 'article_id', in: :path, type: :integer, description: 'article_id'

    get('last_ten_comments article') do
      tags 'Article'
      response(200, 'successful') do
        let(:author_id) { '123' }
        let(:article_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/authors/{author_id}/articles/{article_id}/search_current_value' do
    # You'll want to customize the parameter types...
    parameter name: 'author_id', in: :path, type: :integer, description: 'author_id'
    parameter name: 'article_id', in: :path, type: :integer, description: 'article_id'

    post('search_current_value article') do
      tags 'Article'
      response(200, 'successful') do
        let(:author_id) { '123' }
        let(:article_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/authors/{author_id}/articles/{article_id}/filtration_articles' do
    # You'll want to customize the parameter types...
    parameter name: 'author_id', in: :path, type: :integer, description: 'author_id'
    parameter name: 'article_id', in: :path, type: :integer, description: 'article_id'

    post('filtration_articles article') do
      tags 'Article'
      response(200, 'successful') do
        let(:author_id) { '123' }
        let(:article_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/authors/{author_id}/articles/{article_id}/sorting_articles' do
    # You'll want to customize the parameter types...
    parameter name: 'author_id', in: :path, type: :integer, description: 'author_id'
    parameter name: 'article_id', in: :path, type: :integer, description: 'article_id'

    post('sorting_articles article') do
      tags 'Article'
      response(200, 'successful') do
        let(:author_id) { '123' }
        let(:article_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/authors/{author_id}/articles' do
    # You'll want to customize the parameter types...
    parameter name: 'author_id', in: :path, type: :integer, description: 'author_id'

    get('list articles') do
      tags 'Article'
      response(200, 'successful') do
        let(:author_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create article') do
      tags 'Article'
      response(200, 'successful') do
        let(:author_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/authors/{author_id}/articles/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'author_id', in: :path, type: :integer, description: 'author_id'
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    get('show article') do
      tags 'Article'
      response(200, 'successful') do
        let(:author_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update article') do
      tags 'Article'
      response(200, 'successful') do
        let(:author_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete article') do
      tags 'Article'
      response(200, 'successful') do
        let(:author_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
