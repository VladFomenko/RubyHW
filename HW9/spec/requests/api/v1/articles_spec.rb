require 'swagger_helper'

RSpec.describe 'api/v1/articles', type: :request do
  path '/api/v1/authors/{author_id}/articles/{article_id}/unpublished_comments' do
    # You'll want to customize the parameter types...
    parameter name: :author_id, in: :path, type: :integer, description: 'author_id'
    parameter name: :article_id, in: :path, type: :integer, description: 'article_id'

    get('unpublished comments for the article') do
      tags 'Article'
      response(200, 'successful') do
        let(:author)     { Author.create(name: 'name') }
        let(:article)    { Article.create(title: 'title', body: 'body', author:) }
        let(:comment)    { Comment.create(body: 'body', author_id: author, article_id: article) }
        let(:author_id)  { author.id }
        let(:article_id) { article.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! do |response|
          expect(response.body.nil?).to eq(false)
          expect(response.body).to eq(nil)
        end
      end
    end
  end

  path '/api/v1/authors/{author_id}/articles/{article_id}/published_comments' do
    # You'll want to customize the parameter types...
    parameter name: :author_id, in: :path, type: :integer, description: 'author_id'
    parameter name: :article_id, in: :path, type: :integer, description: 'article_id'

    get('published comments for the article') do
      tags 'Article'
      response(200, 'successful') do
        let(:author)     { Author.create(name: 'name') }
        let(:article)    { Article.create(title: 'title', body: 'body', author:) }
        let(:comment)    { Comment.create(body: 'body', author_id: author, article_id: article) }
        let(:author_id)  { author.id }
        let(:article_id) { article.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! do |response|
          expect(response.body.nil?).to eq(false)
          expect(response.body).to eq(nil)
        end
      end
    end
  end

  path '/api/v1/authors/{author_id}/articles/{article_id}/last_ten_comments' do
    # You'll want to customize the parameter types...
    parameter name: :author_id, in: :path, type: :integer, description: 'author_id'
    parameter name: :article_id, in: :path, type: :integer, description: 'article_id'

    get('last ten comments for the article') do
      tags 'Article'
      response(200, 'successful') do
        let(:author)     { Author.create(name: 'name') }
        let(:article)    { Article.create(title: 'title', body: 'body', author:) }
        let(:comment)    { Comment.create(body: 'body', author_id: author, article_id: article) }
        let(:author_id)  { author.id }
        let(:article_id) { article.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! do |response|
          expect(response.body.nil?).to eq(false)
          expect(response.body).to eq(nil)
        end
      end
    end
  end

  path '/api/v1/authors/{author_id}/articles/{article_id}/search_current_value' do
    # You'll want to customize the parameter types...
    parameter name: :author_id, in: :path, type: :integer, description: 'author_id'
    parameter name: :article_id, in: :path, type: :integer, description: 'article_id'

    post('search_current_value article') do
      tags 'Article'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          word: { type: :string }
        }
      }
      response(200, 'successful') do
        let(:author)     { create(:author) }
        let(:article)    { create(:article, author:) }
        let(:author_id)  { author.id }
        let(:article_id) { article.id }

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

  path '/api/v1/authors/{author_id}/articles/{article_id}/filtration_articles?tags="pretty"' do
    # You'll want to customize the parameter types...
    parameter name: :author_id, in: :path, type: :integer, description: 'author_id'
    parameter name: :article_id, in: :path, type: :integer, description: 'article_id'

    post('filtration_articles') do
      tags 'Article'
      parameter name: :article, in: :body, description: "search by status, tags, author's name", schema: {
        type: :object,
        properties: {
          key: { type: :string }
        }
      }
      response(200, 'successful') do
        let(:author)     { create(:author) }
        let(:article)    { create(:article, author:) }
        let(:author_id)  { author.id }
        let(:article_id) { article.id }

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
    parameter name: :author_id, in: :path, type: :integer, description: 'author_id'
    parameter name: :article_id, in: :path, type: :integer, description: 'article_id'

    post('sorting_articles') do
      tags 'Article'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          order: { type: :string }
        }
      }
      response(200, 'successful') do
        let(:author)     { create(:author) }
        let(:article)    { create(:article, author:) }
        let(:author_id)  { author.id }
        let(:article_id) { article.id }

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

  path '/api/v1/authors/{author_id}/articles?articles[title]=title&articles[body]=body' do
    # You'll want to customize the parameter types...
    parameter name: :author_id, in: :path, type: :integer, description: 'author_id'

    get('list articles') do
      tags 'Article'
      response(200, 'successful') do
        let(:author)    { Author.create(name: 'name') }
        let(:article)   { Article.create(title: 'title', body: 'body', author:) }
        let(:author_id) { author.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! do |response|
          expect(response.body.nil?).to eq(false)
          expect(response.body).to eq(nil)
        end
      end
    end

    post('create article') do
      tags 'Article'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :text }
        }
      }
      response(201, 'successful') do
        let(:author)    { create(:author) }
        let(:author_id) { author.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! do |response|
          expect(response.body.nil?).to eq(false)
          expect(response.body).to eq(nil)
        end
      end
    end
  end

  path '/api/v1/authors/{author_id}/articles/{id}?articles[title]=title' do
    # You'll want to customize the parameter types...
    parameter name: :author_id, in: :path, type: :integer, description: 'author_id'
    parameter name: :id, in: :path, type: :integer, description: 'id'

    get('show article') do
      tags 'Article'
      response(200, 'successful') do
        let(:author)    { Author.create(name: 'name') }
        let(:article)   { Article.create(title: 'title', body: 'body', author:) }
        let(:author_id) { author.id }
        let(:id)        { article.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! do |response|
          expect(response.body.nil?).to eq(false)
          expect(response.body).to eq(nil)
        end
      end
    end

    patch('update article') do
      tags 'Article'
      response(200, 'successful') do
        let(:author)    { create(:author) }
        let(:article)   { create(:article, author:) }
        let(:author_id) { author.id }
        let(:id)        { article.id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test! do |response|
          expect(response.body.nil?).to eq(false)
          expect(response.body).to eq(nil)
        end
      end
    end

    delete('delete article') do
      tags 'Article'
      response(200, 'successful') do
        let(:author)    { Author.create(name: 'name') }
        let(:article)   { Article.create(title: 'title', body: 'body', author:) }
        let(:author_id) { author.id }
        let(:id)        { article.id }

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
