# Fidelity Linux Image Cleanup

**Quick Start**: Copy `cleanup-images.conf`, edit values, then run `cleanup-images.sh -c cleanup-images.conf --dry-run`.

## Overview
Automate removal of outdated Fidelity custom Linux image files on EC2 hosts. This project provides a safe, configurable bash script with logging and dry-run validation.

## Files
- [`cleanup-images.sh`](cleanup-images.sh) – Main cleanup script
- [`cleanup-images.conf`](cleanup-images.conf) – Configuration template
- [`install.sh`](install.sh) – Installation helper

## Before You Start
- Confirm you have VPN access and credentials for the Fidelity AWS environment.
- Ensure your Windows workstation has **Git for Windows** (includes OpenSSH). Download from <https://git-scm.com/download/win> if needed.
- Install the **AWS CLI v2** and verify with `aws --version` in PowerShell.
- (If using Session Manager) Install the **Session Manager plugin** and verify with `session-manager-plugin --version`.
- Request the bastion host DNS/IP and target EC2 instance details from your platform team.
- Ask for the directory path where images are stored, the filename pattern, and required retention days.

## Quick Setup
```bash
./install.sh
cp cleanup-images.conf /etc/fidelity/cleanup-images.conf
cleanup-images.sh -c /etc/fidelity/cleanup-images.conf --dry-run
```

## Step-by-Step Guide

### 1. Prepare Your Windows Workstation
1. Launch PowerShell as yourself (no admin required).
2. Run `ssh
Choose one access method your organization supports:

- **SSH through bastion**
  ```bash
  ssh user@bastion-host
  ssh ec2-user@target-instance
  ```
- **AWS Systems Manager Session Manager** (no SSH keys required)
  ```bash
  aws ssm start-session --target <instance-id>
  ```

If you use Session Manager, transfer the script by copying it to S3 or use the `aws ssm send-command` feature per company policy.

### 5. Install the Script on the Linux Host
1. Verify the script arrived: `ls -l /tmp/cleanup-images.sh`.
2. Move it into place and set permissions:
   ```bash
   sudo mv /tmp/cleanup-images.sh /usr/local/bin/
   sudo chmod 750 /usr/local/bin/cleanup-images.sh
   ```
3. Confirm it runs: `cleanup-images.sh --help`. You should see usage details.

### 6. Collect Cleanup Parameters
1. Identify the directory where image files live (for example `/var/lib/fidelity-images`).
2. Confirm the naming pattern (for example `fidelity-linux-*.img`).
3. Decide how many days of images to keep (for example `14`).
4. Record these values—you will reuse them for dry-run and production runs.

### 7. Perform a Dry Run
1. Test using environment variables (safer for first run):
   ```bash
   CLEANUP_IMAGE_DIR=/var/lib/fidelity-images \
   CLEANUP_IMAGE_PATTERN="fidelity-linux-*.img" \
   CLEANUP_RETENTION_DAYS=14 \
   cleanup-images.sh --dry-run
   ```
2. Review the output carefully. Only files you intend to delete should appear as `[DRY-RUN] Would delete:` lines.
3. If nothing appears, verify the directory, pattern, and retention inputs, then re-run.

### 8. Execute the Real Cleanup
1. Run the script without `--dry-run` once you are confident:
   ```bash
   cleanup-images.sh -p /var/lib/fidelity-images -f "fidelity-linux-*.img" -r 14
   ```
2. Watch the output for `Deleting:` lines and confirm the expected files are removed.
3. Optionally verify the directory afterward with `ls -lh /var/lib/fidelity-images`.

### 9. Automate with Cron (Optional)
1. Open the root cron table (requires sudo):
   ```bash
   sudo crontab -e
   ```
2. Add a nightly cleanup job at 02:00:
   ```
   0 2 * * * CLEANUP_IMAGE_DIR=/var/lib/fidelity-images CLEANUP_IMAGE_PATTERN="fidelity-linux-*.img" CLEANUP_RETENTION_DAYS=14 /usr/local/bin/cleanup-images.sh >> /var/log/cleanup-images.log 2>&1
   ```
3. Save the cron file, then verify the entry with `sudo crontab -l`.
4. Check the log file after the first scheduled run to confirm results.

### 10. (Optional) Integrate with Python
If you prefer orchestrating the cleanup from Python, run this script on the host:
```python
import subprocess

subprocess.run(
    [
        "/usr/local/bin/cleanup-images.sh",
        "-p", "/var/lib/fidelity-images",
        "-f", "fidelity-linux-*.img",
        "-r", "14",
        "--dry-run",
    ],
    check=True,
)
```

## Alternative Approaches
- **AWS Data Lifecycle Manager**: Manage AMI and snapshot retention without custom scripts.
- **Custom Python (`boto3`)**: Deregister AMIs and clean snapshots programmatically when additional logic is needed.
- **S3 Lifecycle Policies**: If images are stored in S3 buckets, use native expiration rules.

## Safety Tips
- Always run a dry run (`--dry-run`) before deleting files.
- Keep recent backups until you have validated the automated job over several cycles.
- Redirect output to log files so you can audit what was removed (`>> /var/log/cleanup-images.log 2>&1`).
- Restrict write permissions on the script and directories to reduce accidental deletions.
