require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do

  path '/api/v1/authors/{author_id}/comments' do
    # You'll want to customize the parameter types...
    parameter name: 'author_id', in: :path, type: :integer, description: 'author_id'

    get('list comments') do
      tags 'Comments'
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

    post('create comment') do
      tags 'Comments'
      parameter name: :comment, in: :query, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          article_id: { type: :integer }
        }
      }
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

  path '/api/v1/authors/{author_id}/comments/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'author_id', in: :path, type: :integer, description: 'author_id'
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    get('show comment') do
      tags 'Comments'
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

    patch('update comment') do
      tags 'Comments'
      parameter name: :comment, in: :query, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          article_id: { type: :integer },
          status: { type: :integer }
        }
      }
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

    delete('delete comment') do
      tags 'Comments'
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
