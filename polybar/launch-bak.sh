# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar example 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."

# Launch Polybar on all connected monitors
#for m in $(polybar --list-monitors | cut -d":" -f1); do
#    MONITOR=$m polybar --reload example &
#done

