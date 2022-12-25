require 'swagger_helper'

RSpec.describe 'api/v1/authors', type: :request do

  path '/api/v1/authors' do

    get('list authors') do
      tags 'Authors'
      response(200, 'successful') do

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

    post('create author') do
      tags 'Authors'
      parameter name: :author, in: :query, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        }
      }
      response(200, 'successful') do
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

  path '/api/v1/authors/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    get('show author') do
      tags 'Authors'
      response(200, 'successful') do
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

    patch('update author') do
      tags 'Authors'
      parameter name: :author, in: :query, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        }
      }
      response(200, 'successful') do
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

    delete('delete author') do
      tags 'Authors'
      response(200, 'successful') do
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
