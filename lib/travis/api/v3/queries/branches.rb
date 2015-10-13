module Travis::API::V3
  class Queries::Branches < Query
    sortable_by :name,
      last_build: "builds.started_at".freeze,
      exists_on_github: "(case when branches.exists_on_github then 1 else 2 end)".freeze

    default_sort "last_build:desc"

    def find(repository)
      sort repository.branches
    end
  end
end
