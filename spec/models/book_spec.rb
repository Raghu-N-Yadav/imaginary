require 'rails_helper'

RSpec.describe Book, type: :model do
  # let(:check_book) {build(:book)}
  
  describe 'schema' do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:year_published).of_type(:integer) }
    it { should have_db_column(:price).of_type(:decimal) }
    it { should have_db_column(:views).of_type(:integer) }
    it { should have_db_column(:out_of_print).of_type(:boolean) }
    it { should have_db_column(:supplier_id).of_type(:integer) }
    it { should have_db_column(:author_id).of_type(:integer) }

  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:views) }
    it { should validate_uniqueness_of(:title).ignoring_case_sensitivity }
  end

  describe 'create' do
    it "should create a valid book" do
      author = create(:author)
      # author.save
      supplier = create(:supplier)
      # supplier.save
      # book = build(:book,supplier: supplier,author: author)
      book = build_stubbed(:book,supplier: supplier,author: author)

      # puts "*******************"
      # puts book.id.inspect
      # book.save
      # puts(book.errors.full_messages)
      expect(book.present?).to eq(true)
    end

    it "should check for traits" do
      author = create(:author)
      supplier = create(:supplier)
      new_book = build(:printed_book, supplier: supplier, author: author)

      # puts "*******************"
      # puts new_book.id.inspect
      # built_authors = build_list(:author,3)
      # built_authors.each do |author|
      #   puts author.first_name
      # end

      expect(new_book.title).to eq "Jhon"
    end
  end
end
