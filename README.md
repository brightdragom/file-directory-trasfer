# File and Directory Transfer Script

This Bash script allows you to securely transfer files and directories to a remote server using `scp`. It supports both relative and absolute paths, providing a user-friendly way to handle secure file transfers.

---

## Features

- Supports both **files** and **directories** for transfer.
- Handles both **relative** and **absolute** paths.
- Displays clear error messages for invalid inputs or failed transfers.
- Uses `scp` for secure file transfers.
- Interactive prompts for seamless user experience.

---

## Requirements

- Linux or macOS system with Bash.
- `scp` command installed (typically included with `openssh-client`).
- SSH access to the target remote server.

---

## Usage

### Step 1: Clone the repository
```bash
git clone https://github.com/your-username/file-transfer-script.git
cd file-transfer-script
```
## Step 2: Make the Script Executable
To run the script, you need to grant it executable permissions. Run the following command:
```bash
chmod +x file_or_directory_transfer.sh
```

## Step 3: Execute the Script
Run the script and follow the interactive prompts:
```bash
./file_or_directory_transfer.sh
```

## Step 4: Follow the Prompts

Once the script starts, it will guide you through the process step-by-step:

1. **Input the file or directory path**:  
   Enter the relative or absolute path to the file or directory you wish to transfer.

2. **Specify the server address**:  
   Provide the target server’s SSH address (e.g., `user@192.168.1.100`).

3. **Set the destination path**:  
   Indicate the directory on the remote server where the file or directory should be stored
.
## Examples

Example 1: Transferring a File
```bash
Enter the path to the file or directory: ./example.txt
Enter the server address: user@192.168.1.100
Enter the destination path: /home/user/uploads
```
Output:
```bash
Transferring file...
example.txt                                           100%   10KB 100.0MB/s   00:00
Transfer completed successfully.
```
Example 2: Transferring a Directory
```bash
Enter the path to the file or directory: ./my_folder
Enter the server address: user@192.168.1.100
Enter the destination path: /home/user/uploads
```
Output:
```bash
Transferring directory...
my_folder/file1.txt                                   100%   5KB  50.0MB/s   00:00
my_folder/file2.txt                                   100%   8KB  80.0MB/s   00:00
Transfer completed successfully.
```
## Script Logic

1. **Path Validation**:
   - Validates the provided path using the following checks:
     - **Existence**: Ensures the path exists (`-e`).
     - **Type Differentiation**: Determines whether the path is:
       - A file (`-f`).
       - A directory (`-d`).

2. **Absolute Path Conversion**:
   - Converts relative paths to absolute paths for consistent handling using `realpath`.

3. **File or Directory Transfer**:
   - Transfers the specified content to the remote server based on its type:
     - **Files**: Transferred using `scp`.
     - **Directories**: Transferred recursively using `scp -r`.

4. **Error Handling**:
   - Provides descriptive error messages for:
     - Invalid inputs (e.g., non-existent paths).
     - Issues encountered during the transfer process.
