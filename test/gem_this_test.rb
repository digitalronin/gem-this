require File.join(File.dirname(__FILE__), 'test_helper')

class GemThisTest < Test::Unit::TestCase
  context "When building a gem" do
    setup do
      build_gem do
        file "README"
        lib %w(thing.rb)
      end
    end

    should "contain lib files" do
      assert_gem_contains "lib/thing.rb"
    end
    
    should "include the README" do
      assert_gem_contains "README"
    end
    
    should "put lib in require path" do
      assert_gem_spec :require_paths, ["lib"]
    end
  end
  
  context "When building a gem with specs" do
    setup do
      build_gem do
        lib %w(thing.rb)
        spec %w(my_spec.rb)
      end
    end
    
    should "create a rake task for running specs" do
      assert_rake_task :spec
    end
  end
end  