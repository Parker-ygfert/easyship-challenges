# frozen_string_literal: true

namespace :db do
  desc 'update company uuid'
  task update_company_uuid: :environment do
    uuid_nil = Company.where(uuid: nil)

    if uuid_nil.count != 0
      puts '-' * 10
      puts 'updating uuid'

      uuid_nil.each do |uuid|
        uuid.generate_uuid
        uuid.save
        print '.'
      end

      puts 'done!'
      puts '-' * 10
    end
  end
end
