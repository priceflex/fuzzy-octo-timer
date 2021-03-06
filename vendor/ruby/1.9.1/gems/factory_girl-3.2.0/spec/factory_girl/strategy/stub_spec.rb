require 'spec_helper'

describe FactoryGirl::Strategy::Stub do
  it_should_behave_like "strategy with association support", FactoryGirl::Strategy::Stub
  it_should_behave_like "strategy with callbacks", :after_stub
  it_should_behave_like "strategy with strategy: :build", FactoryGirl::Strategy::Stub

  context "asking for a result" do
    before { Timecop.freeze(Time.now) }
    after  { Timecop.return }
    let(:result_instance) do
      define_class("ResultInstance") do
        attr_accessor :id
      end.new
    end

    let(:evaluation)  { stub("evaluation", object: result_instance, notify: true) }

    it { subject.result(evaluation).should_not be_new_record }
    it { subject.result(evaluation).should be_persisted }

    it "assigns created_at" do
      created_at = subject.result(evaluation).created_at
      created_at.should == Time.now

      Timecop.travel(150000)

      subject.result(evaluation).created_at.should == created_at
    end

    [:save, :destroy, :connection, :reload, :update_attribute].each do |database_method|
      it "raises when attempting to connect to the database by calling #{database_method}" do
        expect do
          subject.result(evaluation).send(database_method)
        end.to raise_error(RuntimeError, "stubbed models are not allowed to access the database")
      end
    end
  end
end
