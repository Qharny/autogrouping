import os

def pick_file():
    file_path = input("Enter the file path: ")
    if os.path.exists(file_path):
        with open(file_path, 'r') as file:
            lines = file.readlines()
        return lines
    else:
        print("File not found.")
        return []

def read_strings():
    strings = input("Enter strings separated by space: ").split()
    return strings

def read_numbers():
    numbers = input("Enter numbers separated by space: ").split()
    numbers = [int(num) for num in numbers]
    return numbers

def group_data(input_data, num_of_groups, entities_per_group):
    grouped_data = []
    start = 0
    end = entities_per_group
    for i in range(num_of_groups):
        group = input_data[start:end]
        grouped_data.append(group)
        start = end
        end += entities_per_group
    return grouped_data

def store_data_to_file(grouped_data, file_name):
    with open(file_name, 'w') as file:
        for i, group in enumerate(grouped_data, start=1):
            file.write(f"Group {i}:\n")
            for item in group:
                file.write(f"{item}\n")
            file.write("\n")

def main():
    print('Select the data type:')
    print('1. File (Read from an external file)')
    print('2. Strings')
    print('3. Numbers/Integers')
    choice = int(input('Enter your choice: '))

    input_data = []

    if choice == 1:
        input_data = pick_file()
    elif choice == 2:
        input_data = read_strings()
    elif choice == 3:
        input_data = read_numbers()
    else:
        print('Invalid choice')
        return

    num_of_groups = int(input('Enter the number of groups: '))
    entities_per_group = int(input('Enter the number of entities in each group: '))

    print('Please wait... Your grouping will be done soon')

    grouped_data = group_data(input_data, num_of_groups, entities_per_group)

    store_data_to_file(grouped_data, 'grouped_data.txt')

    print('Grouping completed. Check grouped_data.txt for the result.')

if __name__ == "__main__":
    main()
