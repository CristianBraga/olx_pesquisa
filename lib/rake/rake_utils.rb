##
# Utility methods used in rake tasks.
#
module RakeUtils

  TEST_AREAS = %w[
    teste_olx td
  ].freeze

  DEFAULT_TEST_AREA = 'teste_olx'.freeze

  module_function

  def parse_test_area(area)
    return DEFAULT_TEST_AREA unless area
    raise 'Invalid test area.' unless TEST_AREAS.include? area
    area.size < 5 ? Hash[*TEST_AREAS.reverse.flatten][area] : area
  end

end
