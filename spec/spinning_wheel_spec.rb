RSpec.describe SpinningWheel do

  SpinningWheel.define do
    fabric name: 'avenger', class_name: 'Avenger' do
      name { 'Tony' }
      age { 49 }
      display { true }
    end
  end

  SpinningWheel.define do
    fabric name: 'avenger_hulk', class_name: 'Avenger' do
      name { 'Hulk' }
      age { 48 }
      display { true }
    end
  end

  SpinningWheel.define do
    fabric name: 'hash_avenger', class_name: 'HashAvenger' do
      name { 'Tony' }
      age { 49 }
      display { true }
    end
  end

  SpinningWheel.define do
    fabric name: 'optional_avenger', class_name: 'OptionalAvenger' do
      name { 'Tony' }
      age { 49 }
      display { true }
      options { {a: 'a', b: 'b'} }
    end
  end

  SpinningWheel.define do
    fabric name: 'avengers', class_name: 'Group' do
      first { SpinningWheel.create('avenger') }
      second { SpinningWheel.create('avenger_hulk') }
    end
  end

  context 'simple fabric' do
    puts "Avenger"
    let(:fabric_name) { 'avenger' }
    let(:class_name) { 'Avenger' }
    let(:name) { 'Tony' }
    let(:age) { 49 }

    let(:fabric_object) { SpinningWheel.create(fabric_name) }

    describe 'object' do
      it 'should hold a the fabrics class type' do
        expect(fabric_object).to be_a(class_name.constantize)
      end

      context 'attributes' do
        it 'should hold the name attribute' do
          expect(fabric_object.name).to eq(name)
        end

        it 'should hold the age attribute' do
          expect(fabric_object.age).to eq(age)
        end
      end
    end
  end

  context 'simple fabric hash' do
    puts "HashAvenger"
    let(:fabric_name) { 'hash_avenger' }
    let(:class_name) { 'HashAvenger' }
    let(:name) { 'Tony' }
    let(:age) { 49 }
    let(:display) { true }

    let(:fabric_object) { SpinningWheel.create(fabric_name) }

    describe 'object' do
      it 'should hold a the fabrics class type' do
        expect(fabric_object).to be_a(class_name.constantize)
      end

      context 'attributes' do
        it 'should hold the name attribute' do
          expect(fabric_object.name).to eq(name)
        end

        it 'should hold the age attribute' do
          expect(fabric_object.age).to eq(age)
        end
      end
    end
  end

  context 'simple fabric hash with optionals' do
    let!(:fabric_name) { 'optional_avenger' }
    let!(:class_name) { 'OptionalAvenger' }
    let!(:name) { 'Tony' }
    let!(:age) { 49 }

    let(:fabric_object) { SpinningWheel.create(fabric_name) }

    describe 'object' do
      it 'should hold a the fabrics class type' do
        expect(fabric_object).to be_a(class_name.constantize)
      end

      context 'attributes' do
        it 'should hold the name attribute' do
          expect(fabric_object.name).to eq(name)
        end

        it 'should hold the age attribute' do
          expect(fabric_object.age).to eq(age)
        end
      end
    end
  end

  context 'nexted fabric objects' do
    let(:fabric_name) { 'avengers' }
    let(:class_name) { 'Group' }
    let(:child_class_name) { 'Avenger' }
    let(:first_name) { 'Tony' }
    let(:second_name) { 'Hulk' }
    let(:first_age) { 49 }
    let(:second_age) { 48 }

    let ( :fabric_object ) { SpinningWheel.create(fabric_name) }

    describe 'object' do
      it 'should hold a the fabrics class type' do
        expect(fabric_object).to be_a(class_name.constantize)
      end

      context 'attributes' do
        it 'should hold the first avenger with the class Avenger' do
          expect(fabric_object.first).to be_a('Avenger'.constantize)
        end

        context 'first' do
          it 'should hold the name attribute' do
            expect(fabric_object.first.name).to eq(first_name)
          end

          it 'should hold the age attribute' do
            expect(fabric_object.first.age).to eq(first_age)
          end
        end

        context 'second' do
          it 'should hold the name attribute' do
            expect(fabric_object.second.name).to eq(second_name)
          end

          it 'should hold the age attribute' do
            expect(fabric_object.second.age).to eq(second_age)
          end
        end
      end
    end
  end

end
