linux_platforms.each do |p|
    eval("#{p}_versions").each do |v|
      context "When all attributes are default, on #{p} #{v}" do
        cached(:node_attributes) do
          { platform: p, version: v }
        end

        cached(:chef_run) do
          ChefSpec::SoloRunner.new(platform: p, version: v) do |node|
          end.converge(described_recipe)
        end

        cached(:included_recipes) do
          %w{
            chef_jenkins::default
            chef_jenkins::install
          }
        end

        it 'has necessary recipes' do
          included_recipes.each { |name| expect(chef_run).to include_recipe(name) }
        end

        it 'does not raise an error' do
          expect(Chef::Formatters::ErrorMapper).to_not receive(:file_load_failed)
          expect { chef_run }.to_not raise_error
        end

      end
    end
 end
