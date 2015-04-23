require 'spec_helper'
describe 'ffmpeg' do

  context 'with defaults for all parameters' do
    it { should contain_class('ffmpeg') }
  end
end
